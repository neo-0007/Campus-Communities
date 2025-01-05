import { Navbar } from "../components/Navbar";
import { useEffect, useState } from "react";
import ImageSlider from "../components/Slider";
import { Sidebar } from "../components/Sidebar";
import axios from "axios";
import useAuth from "../components/useAuthRedirect";

interface IBanner {
    id: string;
    title: string;
    image_url: string;
}

export const Home = () => {
    const [banners, setBanners] = useState<IBanner[]>([]);
    const { user } = useAuth();
    const [images, setImages] = useState<string[]>([]);
    const [noOfActiveBanners, setNoOfActiveBanners] = useState(0);

    const rightIcons = [
        { name: "Explore", icon: "/explore.svg", color: "#cccef6", link: "#" },
        { name: "Lobby", icon: "/lobby.svg", color: "#f0ced0", link: "#" },
        { name: "Complaints", icon: "/complaints.svg", color: "#e3e4e6", link: "#" },
        { name: "People", icon: "/people.svg", color: "#d7f5b7", link: "#" },
        { name: "Trade", icon: "/trade.svg", color: "#f4deb7", link: "#" },
        { name: "Rent", icon: "/rent.svg", color: "#f3ecbb", link: "#" },
    ]

    const fetchImages = async () => {
        try {
            const response = await axios.get(
                `${import.meta.env.VITE_BASE_URL}/api/banner/active/institute/1`,
                { withCredentials: true }
            );
            setNoOfActiveBanners(response.data.length);
            setBanners(response.data.data);
        } catch (error) {
            console.log("Error fetching images", error);
        }
    };

    useEffect(() => {
        fetchImages();
    }, []); 

        // Update images state once banners have been fetched
        useEffect(() => {
            if (banners.length > 0) {
                const bannerImages = banners.map((banner) => banner.image_url);
                setImages(bannerImages);
            }
        }, [banners && noOfActiveBanners]);

    return (
        <div>
            <div className="max-sm:hidden">
                <div className="bg-white py-3">
                    <Navbar />
                </div>
                <div className="bg-[#f0f2f4]">
                    <div className="grid grid-cols-[auto_52%_25%]">
                        <Sidebar />
                        <div className="flex flex-col mx-8 my-10 space-y-10">
                            <div>
                                <div className="font-bold text-[20px] my-2">
                                    Events
                                </div>
                                <div>
                                    <ImageSlider images={images} length={noOfActiveBanners} />
                                </div>
                            </div>
                            <div>
                                <div className="font-bold text-[20px] my-2">
                                    Notifications
                                </div>
                                <div className="bg-[#ffffff] h-56 rounded-[16px] shadow-xl flex flex-col justify-evenly text-center font-bold  text-gray-700">
                                    Comming Soon ...
                                </div>
                            </div>
                        </div>
                        <div className="flex flex-col mx-8 my-10">
                            <div className="font-bold text-[20px] my-2">
                                Services
                            </div>
                            <div className="flex flex-col justify-center space-y-5">
                                {rightIcons.map((icon, index) => (
                                    <div key={index} style={{ backgroundColor: icon.color }} className="flex flex-row items-center p-2 rounded-lg cursor-pointer transition duration-300 px-10 h-16 hover:border-2 hover:border-black hover:border-solid">
                                        <img src={icon.icon as string} className="w-12 object-contain mx-2" alt={icon.name} />
                                        <div className="text-gray-800 mx-1 font-bold">{icon.name}</div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div className="sm:hidden">
                <div className="py-3">
                    <Navbar />
                </div>
                <div>
                    <div className="px-5 py-5">
                        <div>
                            <ImageSlider images={images} length={noOfActiveBanners} />
                        </div>
                        <div className="my-4 mb-20">
                            <div className="my-2 mx-2 font-bold text-2xl">Services</div>
                            <div className="flex flex-row flex-wrap justify-center">
                                {rightIcons.map((icon, index) => (
                                    <div key={index} style={{ backgroundColor: icon.color }} className="flex flex-col items-center p-2 rounded-lg cursor-pointer transition duration-300 px-10 h-24 w-28 hover:border-2 hover:border-black hover:border-solid justify-center mx-2 my-2">
                                        <img src={icon.icon as string} className="w-12 object-contain mx-2" alt={icon.name} />
                                        <div className="text-gray-800 mx-1 font-bold">{icon.name}</div>
                                    </div>
                                ))}
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div>
                            <Sidebar />
                            </div>
            </div>
        </div>
    );
}