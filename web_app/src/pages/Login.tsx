import { useState } from "react";
import { FaArrowLeft, FaArrowRight } from "react-icons/fa"
import { toast } from "react-toastify";

export default function Login() {
    const [userDetails, setUserDetails] = useState({
        rollNumber: "",
        password: "",
    })

    const handleSubmission = (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        if (!(/^[A-Za-z]+$/.test(userDetails.rollNumber[0])) || !(/^[0-9]+$/.test(userDetails.rollNumber[(userDetails.rollNumber.length - 1)])) || userDetails.rollNumber.length < 6) {
            toast.error("Invalid Roll Number! Should be in the format CSB23023 or csb23078")
        } else {
            toast.success("Successfully logged in! Welcome again")
            console.log(userDetails);
        }
    }

    return (
        <div className="grid grid-cols-[57%_auto] h-screen">
            <div className="flex flex-col">
                <div className="mx-5 my-3">
                    <img src="/logo.png" className="w-[360px]" alt="Campus Communities" />
                </div>

                <div className="mx-auto my-12 w-full max-w-lg rounded-lg bg-white p-8 shadow-xl">
                    <div className="text-center">
                        <h1 className="text-3xl font-bold text-gray-800">Login</h1>
                        <p className="mt-2 text-gray-500">Ahh a member I see, Welcome again !</p>
                    </div>

                    <form
                        className="mt-8 space-y-6"
                        onSubmit={handleSubmission}
                    >
                        <div className="space-y-4">
                            <input
                                type="text"
                                placeholder="Roll Number"
                                className="w-full rounded-lg border border-gray-300 bg-gray-50 px-4 py-3 text-sm text-gray-700 focus:border-blue-500 focus:ring focus:ring-blue-200"
                                onChange={(e) =>
                                    setUserDetails({ ...userDetails, rollNumber: e.target.value })
                                }
                                value={userDetails.rollNumber}
                                required
                            />
                            <input
                                type="password"
                                placeholder="Password"
                                className="w-full rounded-lg border border-gray-300 bg-gray-50 px-4 py-3 text-sm text-gray-700 focus:border-blue-500 focus:ring focus:ring-blue-200"
                                onChange={(e) =>
                                    setUserDetails({ ...userDetails, password: e.target.value })
                                }
                                value={userDetails.password}
                                required
                            />
                        </div>

                        <div>
                            <button
                                type="submit"
                                className="group relative w-full cursor-pointer overflow-hidden rounded-md border-2 border-blue-500 bg-white px-5 py-3 text-center font-mono font-semibold"
                            >
                                <span className="ease absolute top-1/2 left-1/2 h-0 w-64 -translate-x-1/2 -translate-y-1/2 rotate-45 bg-blue-500 transition-all duration-300 group-hover:h-64"></span>
                                <span className="ease relative text-blue-500 transition duration-300 group-hover:text-white">
                                    Login <FaArrowRight className="inline ml-2" />
                                </span>
                            </button>
                        </div>
                    </form>

                    <div className="mt-4 text-center">
                        <p className="text-sm text-gray-600">
                            Don't have an account?{" "}
                            <a href="/user/register" className="font-semibold text-blue-500 hover:underline">
                                Signup
                            </a>
                        </p>
                    </div>
                </div>

            </div>
            <div className="bg-[#F5F5F5] bg-cover bg-center h-full w-full rounded-l-[60px] flex justify-evenly">
                <img className="w-[400px] mx-auto my-auto block" src={"/login.png"} alt="" />
            </div>
        </div>
    )
}