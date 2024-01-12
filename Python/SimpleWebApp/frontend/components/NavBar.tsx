"use client";

import Logo from "./Logo";
import MobileSideBar from "./MobileSideBar";

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
            <Logo />
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
