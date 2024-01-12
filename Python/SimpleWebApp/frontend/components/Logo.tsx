import { cn } from '@/lib/utils'
import { Poppins } from 'next/font/google';
import React from 'react'
import { FaPersonThroughWindow } from 'react-icons/fa6'

const font = Poppins({
  subsets: ["latin"],
  weight: ["400", "600"],
});

const Logo = ({className}: {className?: string}) => {
  return (
    <div className={`${className} gap-x-1 flex items-center`}>
          <FaPersonThroughWindow size={25} />
          <h1 className={cn("text-2xl font-[600]", font.className)}>
            SimpleWebApp
          </h1>
        </div>
  )
}

export default Logo