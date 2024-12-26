import { useState } from "react";
import { FaArrowRight } from "react-icons/fa"
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
        <div className="grid sm:grid-cols-2 h-screen">
            <div className="flex flex-col justify-center items-center h-full">

                <div className="mx-auto my-12 w-full max-w-lg rounded-lg bg-white p-8">
                    <div className="text-start">
                        <h1 className="text-3xl font-bold text-gray-800">Login</h1>
                        <p className="mt-2 text-gray-500 max-sm:text-sm">Ahh a member I see, Welcome again !</p>
                    </div>

                    <form
                        className="mt-8 space-y-6"
                        onSubmit={handleSubmission}
                    >
                        <div className="space-y-4">
                            <input
                                type="text"
                                placeholder="Roll Number"
                                className="w-full rounded-lg border border-gray-300 bg-gray-50 px-4 py-3 text-sm text-gray-700 focus:outline-none focus:border-gray-400"
                                onChange={(e) =>
                                    setUserDetails({ ...userDetails, rollNumber: e.target.value })
                                }
                                value={userDetails.rollNumber}
                                required
                            />
                            <input
                                type="password"
                                placeholder="Password"
                                className="w-full rounded-lg border border-gray-300 bg-gray-50 px-4 py-3 text-sm text-gray-700 focus:outline-none focus:border-gray-400"
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
            className="relative w-full cursor-pointer overflow-hidden rounded-md border-2 border-black bg-[#ACC8F7] px-5 py-3 text-center font-mono font-semibold text-white transition-all duration-300 hover:shadow-lg hover:bg-blue-500 hover:border-black"
          >
            <span className="relative text-black">
              LOGIN <FaArrowRight className="inline ml-2 text-black" />
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
            <div className="bg-[#E5E5E5] bg-cover bg-center h-full w-full flex justify-evenly max-sm:hidden">
                <img className="w-[400px] mx-auto my-auto block" src={"/login.png"} alt="" />
            </div>
        </div>
    )
}