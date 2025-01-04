import { useState } from "react";
import { CgProfile } from "react-icons/cg";

import { FaAngleDown } from "react-icons/fa";
import useAuth from "./useAuthRedirect";


export const Sidebar = () => {
    const [navigationTabs, setNavigationTabs] = useState([
        { name: "Home", icon: '/home.icon.svg', isActive: true },
        { name: "Groups", icon: '/groups.icon.svg', isActive: false },
        { name: "Resources", icon: '/resources.icon.svg', isActive: false },
        { name: "AI Tutor", icon: '/ai.icon.svg', isActive: false },
    ])
    const { user } = useAuth()
    // console.log(user)

    return (
        <div>
            <div className="flex flex-col mx-8 my-10 space-y-10 max-sm:hidden">
                <div className="flex flex-col">
                    <div className="my-2 flex justify-center">
                        <CgProfile size={70} className="text-blue-600" />
                    </div>
                    <div className="flex flex-row my-1 font-bold items-center justify-center space-x-2 text-gray-800 text-lg">
                        <div>{user.name}</div>
                        <FaAngleDown size={18} className="text-gray-500" />
                    </div>
                    <div className="my-1 text-slate-600 font-bold text-center">
                        {user.email}
                    </div>
                </div>
                <div className="flex flex-col">
                    <div className="font-bold text-[20px] my-2 text-gray-700 border-b pb-2">
                        Navigation
                    </div>
                    <div className="font-bold my-2 space-y-4">
                        {navigationTabs.map((tab, index) => (
                            <div
                                key={index}
                                className="flex mx-5 space-x-4 items-center p-2 hover:bg-[#cccef6] rounded-lg cursor-pointer transition duration-300"
                            >
                                <img src={tab.icon} className="h-8 w-8 object-contain" alt={tab.name} />
                                <div className="text-gray-800">{tab.name}</div>
                            </div>
                        ))}
                    </div>
                </div>
            </div>
            <div className="fixed bottom-4 sm:hidden w-full px-2 flex justify-center">
    <div className="flex flex-row justify-center space-x-2 bg-[#f0f2f4] shadow-sm shadow-black rounded-[13px] px-3 py-2 max-w-[calc(100%-16px)] overflow-x-auto">
        {navigationTabs.map((tab, index) => (
            <div
                key={index}
                className="flex flex-col items-center p-2 hover:bg-[#cccef6] rounded-lg cursor-pointer transition duration-300"
            >
                <img
                    src={tab.icon}
                    className="h-8 w-8 object-contain"
                    alt={tab.name}
                />
                <div className="text-gray-800 text-[10px]">{tab.name}</div>
            </div>
        ))}
    </div>
</div>

        </div>
    )
}