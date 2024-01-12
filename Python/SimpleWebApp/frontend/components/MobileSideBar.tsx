import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { CgMenuLeftAlt } from "react-icons/cg";

const MobileSideBar = () => {
  return (
    <Sheet>
      <SheetTrigger className="md:hidden hover:opacity-75 transition-all">
        <CgMenuLeftAlt size={24} />
      </SheetTrigger>
      <SheetContent side="left" className="w-60 p-0 shadow-none">
        This is a side bar for mobile devices. This is out of the scope for this
        simple web app.
      </SheetContent>
    </Sheet>
  );
};

export default MobileSideBar;
