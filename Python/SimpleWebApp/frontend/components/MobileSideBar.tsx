import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { CgMenuLeftAlt } from "react-icons/cg";
import Logo from "./Logo";

const MobileSideBar = () => {
  return (
    <Sheet>
      <SheetTrigger className="md:hidden hover:opacity-75 transition-all">
        <CgMenuLeftAlt size={24} />
      </SheetTrigger>
      <SheetContent side="left" className="w-60 p-0 shadow-none">
        <Logo className="mt-10 ml-2" />
        <p>
          <br></br>I would include links to other pages, log in buttons, and
          more. But this is out of the scope of this project.
          <br></br>
          <br></br>
          However, I am currently working on StudyDSA.com which already has a
          fully working authentication system.
        </p>
      </SheetContent>
    </Sheet>
  );
};

export default MobileSideBar;
