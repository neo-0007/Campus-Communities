import { CgProfile } from "react-icons/cg";
import { IoIosNotificationsOutline, IoMdMenu } from "react-icons/io";

export const Navbar = () => {
    return (
        <div className="flex flex-row justify-between sm:mx-6 max-sm:mx-3">
            <div className="flex sm:space-x-8">
            <div className="max-sm:hidden"><IoMdMenu size={35} /></div>
            <div>
            <img src="/logo.png" className="w-[180px]" alt="Campus Communities" />
            </div>
            </div>
            <div className="flex space-x-12">
            <div className="max-sm:hidden">
            <IoIosNotificationsOutline size={35} />
            </div>
            <div>
            <CgProfile  size={35}/>
            </div>
            </div>
        </div>
    )
}