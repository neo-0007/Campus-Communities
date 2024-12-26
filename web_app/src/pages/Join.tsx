import { useEffect, useState } from "react";
import { FaChrome, FaFirefoxBrowser, FaSafari, FaEdge, FaOpera, FaQuestion, FaGooglePlay, FaApple, FaWindows } from 'react-icons/fa';
import { useNavigate } from "react-router-dom";

export const Join = () => {
    const [isPopupOpen, setIsPopupOpen] = useState(false);
    const [browser, setBrowser] = useState({ name: 'Web', icon: FaQuestion });
    const [continueOptions, setContinueOptions] = useState([
        { name: "Android", icon: FaGooglePlay },
        { name: "iOS", icon: FaApple },
        { name: "Windows", icon: FaWindows },
    ]);

    const navigate = useNavigate();
    
    useEffect(() => {
        const userAgent = navigator.userAgent.toLowerCase();
        if (userAgent.includes('chrome') && !userAgent.includes('edge') && !userAgent.includes('opr')) {
            setBrowser({ name: 'Chrome', icon: FaChrome });
        } else if (userAgent.includes('firefox')) {
            setBrowser({ name: 'Firefox', icon: FaFirefoxBrowser });
        } else if (userAgent.includes('safari') && !userAgent.includes('chrome')) {
            setBrowser({ name: 'Safari', icon: FaSafari });
        } else if (userAgent.includes('edge')) {
            setBrowser({ name: 'Edge', icon: FaEdge });
        } else if (userAgent.includes('opr') || userAgent.includes('opera')) {
            setBrowser({ name: 'Opera', icon: FaOpera });
        } else {
            setBrowser({ name: 'Unknown', icon: FaQuestion });
        }
    }, []);

    const Icon = browser.icon;

    return (
        <div className="grid sm:grid-cols-[57%_auto] h-screen">
            <div className="flex flex-col">
                <div className="mx-5 my-3">
                    <img src="/logo.png" className="w-[360px] max-sm:w-[240px]" alt="Campus Communities" />
                </div>
                <div className="mx-28 max-sm:mx-12 my-auto flex flex-col space-y-4">
                    <div className="font-bold text-5xl max-sm:text-3xl">All-in-one <br /> University app</div>
                    <div className="text-2xl max-sm:text-xl">Your ultimate companion for managing your college life effortlessly !</div>
                    <div>
                        <button onClick={() => setIsPopupOpen(true)} className="group relative m-1 cursor-pointer overflow-hidden rounded-md border-2 border-[#649dfe] px-5 py-3 font-mono font-semibold">
                            <span className="ease absolute top-1/2 h-0 w-64 origin-center -translate-x-20 rotate-45 bg-[#649dfe] transition-all duration-300 group-hover:h-64 group-hover:-translate-y-32"></span>
                            <span className="ease relative text-[#649dfe] transition duration-300 group-hover:text-white">JOIN NOW</span></button>
                    </div>
                </div>
            </div>
            <div className="bg-[url('/AuthSideImg.png')] bg-cover bg-center h-full w-full rounded-l-[60px] max-sm:hidden">
            </div>

            {/* Popup */}
            {isPopupOpen && (
                <div className="fixed w-screen h-full bg-black bg-opacity-50 flex justify-center items-center">
                    <div className="bg-white mx-2 p-5 rounded-lg">
                        <div className="flex flex-col space-y-3">
                            <div onClick={() => {
                                setIsPopupOpen(false);
                                navigate('/user/register');
                            }} className="flex items-center space-x-2 text-2xl max-sm:text-lg border-solid border-2 border-black px-5 py-3 rounded-[10px] bg-[#ACC8F7] cursor-pointer hover:bg-[#cbdeff]">
                                <Icon className="text-2xl max-sm:text-lg" />
                                <span>Continue in {browser.name}</span>
                            </div>
                            {continueOptions.map((option, index) => (
                                <div key={index} className="flex items-center space-x-2 text-2xl max-sm:text-lg border-solid border-2 border-black px-5 py-3 rounded-[10px] bg-[#ACC8F7] cursor-pointer hover:bg-[#cbdeff]">
                                    <option.icon className="text-2xl max-sm:text-lg" />
                                    <span>Continue in {option.name}</span>
                                    </div>
                            ))}
                        </div>
                    </div>
                </div>
            )}

        </div>
    );
}