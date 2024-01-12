"use client";

import { usePathname } from "next/navigation";
import MobileSideBar from "./MobileSideBar";
import { FaBook } from "react-icons/fa";
import { cn } from "@/lib/utils";
import { Poppins } from "next/font/google";
import { FaPersonThroughWindow } from "react-icons/fa6";

const font = Poppins({
  subsets: ["latin"],
  weight: ["400", "600"],
});

const NavBar = () => {
  return (
    <div className="shadow-lg fixed top-0 left-0 right-0 z-50 flex items-center bg-background/60 backdrop-blur-[8px]">
      <div className="mx-auto max-w-7xl py-3 px-4 sm:px-6 lg:px-8 w-full">
        <div className="flex items-center justify-between">
          {/* Mobile Sidebar - Small Screens only */}
          <div className="block md:hidden">
            <MobileSideBar />
          </div>

          <div className="hidden md:flex">
            <div className="gap-x-1 flex items-center">
              <FaPersonThroughWindow size={25} />
              <h1 className={cn("text-2xl font-[600]", font.className)}>
                SimpleWebApp
              </h1>
            </div>
          </div>

          <div className="gap-x-2 flex items-center justify-center">
            ReDay Zarra
          </div>
        </div>
      </div>
    </div>
  );
};

export default NavBar;
