"use client";

import { Button } from "@/components/ui/button";
import { Calendar } from "@/components/ui/calendar";
import {
  Card,
  CardContent,
  CardHeader,
  CardTitle
} from "@/components/ui/card";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover";
import { cn } from "@/lib/utils";
import { zodResolver } from "@hookform/resolvers/zod";
import { format } from "date-fns";
import { CalendarIcon } from "lucide-react";
import { useState } from "react";
import { useForm } from "react-hook-form";
import * as z from "zod";
import { useToast } from "./ui/use-toast";

const BetterWordle = () => {
  // Taking care of form stuff
  const formSchema = z.object({
    selectedDate: z.date({
      required_error: "You need to select a date for the magic to happen.",
    }),
  });
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
  });

  // Initialize toaster and answer
  const { toast } = useToast();
  const [answer, setAnswer] = useState("");

  const onSubmit = async (values: z.infer<typeof formSchema>) => {
    const { selectedDate } = values; // Destructuring for clarity

    try {
      // Ensure the date is valid before formatting
      if (selectedDate) {
        const dateString = format(selectedDate, "yyyy-MM-dd");
        console.log(dateString);

        const response = await fetch(
          `https://neal.fun/api/password-game/wordle?date=${dateString}`
        );

        if (!response.ok) {
          throw new Error("Network response was not ok");
        }

        const data = await response.json();
        setAnswer(data.answer.toUpperCase());
      }
    } catch (error) {
      // More specific error handling could be implemented here
      console.error(error);
      toast({
        title: "Something went wrong.",
        description:
          "There was a problem finding the answer from your selected date. Please try again.",
        variant: "destructive",
      });
    }
  };

  const { isSubmitting } = form.formState;

  return (
    <Card className="w-[350px] border-zinc-800">
      <CardHeader className="space-y-2">
        <CardTitle>Future Wordle Answers</CardTitle>
        <p className="text-muted-foreground text-sm">
          Get the <span className="font-bold underline">official future</span>{" "}
          Wordle answer for your selected date.
        </p>
      </CardHeader>
      <CardContent>
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
            <FormField
              control={form.control}
              name="selectedDate"
              render={({ field }) => (
                <FormItem className="flex flex-col">
                  <FormLabel>Reveal Wordle Answer</FormLabel>
                  <Popover>
                    <PopoverTrigger asChild>
                      <FormControl>
                        <Button
                          variant={"outline"}
                          disabled={isSubmitting}
                          className={cn(
                            "w-[240px] pl-3 text-left font-normal",
                            !field.value && "text-muted-foreground"
                          )}
                        >
                          {field.value ? (
                            format(field.value, "PPP")
                          ) : (
                            <span>Pick a date</span>
                          )}
                          <CalendarIcon className="ml-auto h-4 w-4 opacity-50" />
                        </Button>
                      </FormControl>
                    </PopoverTrigger>
                    <PopoverContent className="w-auto p-0 dark" align="start">
                      <Calendar
                        mode="single"
                        className="dark"
                        selected={field.value}
                        onSelect={field.onChange}
                        disabled={(date) => {
                          const today = new Date();
                          const oneYearAgo = new Date();
                          oneYearAgo.setFullYear(today.getFullYear() - 1);

                          const maxDate = new Date();
                          maxDate.setDate(today.getDate() + 27);

                          return date > maxDate || date < oneYearAgo;
                        }}
                        initialFocus
                      />
                    </PopoverContent>
                  </Popover>
                  <FormDescription>
                    Choose a date up to 27 days from today.
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />
            <div className="flex justify-between items-center">
              <Button type="submit" disabled={isSubmitting}>
                Submit
              </Button>
              {answer && (
                <p className="pr-5">
                  Answer: <span className="font-black text-green-600">{answer}</span>
                </p>
              )}
            </div>
          </form>
        </Form>
      </CardContent>
    </Card>
  );
};

export default BetterWordle;
