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
        <div className="grid grid-cols-1 sm:grid-cols-[55%_auto] h-screen">
            {/* Left Section */}
            <div className="flex h-[90%] flex-col items-start">
                <div className="mx-5 my-3 mt-5">
                    <img src="/logo.png" className="w-60 sm:w-[300px]" alt="Campus Communities" />
                </div>
                <div className="mx-8 sm:mx-28 my-auto flex flex-col space-y-4 sm:text-left">
                    <h1 className="font-bold text-3xl sm:text-5xl">
                        All-in-one <br /> University app
                    </h1>
                    <p className="text-xl sm:text-2xl">
                        Your ultimate companion for managing your college life effortlessly!
                    </p>
                    <button
                        onClick={() => setIsPopupOpen(true)}
                        className="group w-56 relative m-1 cursor-pointer overflow-hidden rounded-md border-2 border-[#649dfe] px-5 py-3 font-mono font-semibold"
                    >
                        <span className="ease absolute top-1/2 h-0 w-64 origin-center -translate-x-20 rotate-45 bg-[#649dfe] transition-all duration-300 group-hover:h-64 group-hover:-translate-y-32"></span>
                        <span className="ease relative text-[#649dfe] transition duration-300 group-hover:text-white">
                            JOIN NOW
                        </span>
                    </button>
                </div>
            </div>

            {/* Right Section */}
            <div className="hidden sm:block bg-[url('/AuthSideImg.png')] bg-cover bg-center h-full rounded-l-[60px]"></div>

            {/* Popup */}
            {isPopupOpen && (
                <div className="fixed w-screen h-full bg-black bg-opacity-50 flex justify-center items-center p-4">
                    <div className="bg-white max-w-md w-full p-5 rounded-lg">
                        <div className="flex flex-col space-y-4">
                            <div
                                onClick={() => {
                                    setIsPopupOpen(false);
                                    navigate('/user/register');
                                }}
                                className="flex items-center space-x-2 text-lg border border-black px-5 py-3 rounded-md bg-[#ACC8F7] cursor-pointer hover:bg-[#cbdeff]"
                            >
                                <Icon className="text-2xl" />
                                <span>Continue in {browser.name}</span>
                            </div>
                            {continueOptions.map((option, index) => (
                                <div
                                    key={index}
                                    className="flex items-center space-x-2 text-lg border border-black px-5 py-3 rounded-md bg-[#ACC8F7] cursor-pointer hover:bg-[#cbdeff]"
                                >
                                    <option.icon className="text-2xl" />
                                    <span>Continue in {option.name}</span>
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
};
