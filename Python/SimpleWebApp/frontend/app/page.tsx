import Assignment from "@/components/Assignment";
import BetterWordle from "@/components/BetterWordle";

export default function Home() {
  return (
    <div className="h-full space-y-6">
      <p className="text-muted-foreground">This page is responsive.</p>
      <Assignment />
      <BetterWordle />
    </div>
  );
}
