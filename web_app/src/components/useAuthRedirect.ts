// hooks/useAuth.ts
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchUser } from "../store/authSlice";
import { AppDispatch, RootState } from "../store/store";

const useAuth = () => {
  const dispatch = useDispatch<AppDispatch>();
  const { user, status } = useSelector((state: RootState) => state.auth);

  useEffect(() => {
    if (!user && status === "idle") {
      dispatch(fetchUser());
    }
  }, [dispatch, user, status]);

  const isAuthenticated = user !== null;

  return { user, isAuthenticated, status };
};

export default useAuth;
