import { useMsal } from "@azure/msal-react";
import Button from '@mui/material/Button';
import { useAuth } from "../auth/AuthProvider";
import { useEffect } from "react";

const LoginButton = () => {
    const { instance } = useMsal();
    const { isAuthenticated, account } = useAuth();

    const handleLogin = async () => {
        try {
            const loginResponse = await instance.loginPopup({
                scopes: ["api://8bfb425b-27ce-43b3-97c1-7a0fff23b38cd/access_as_user"]
            });

            instance.setActiveAccount(loginResponse.account);
            window.location.reload(); // 👈 simple way to re-trigger useEffect in AuthProvider
        } catch (error) {
            console.error("Login failed:", error);
        }
    };

    const handleLogout = async () => {
        try {
            await instance.logoutPopup({
                account
            });

            window.location.reload(); // 👈 force AuthProvider to recheck state
        } catch (error) {
            console.error("Logout failed:", error);
        }
    };

    useEffect(() => {
        if (isAuthenticated) {
            console.log("User is authenticated:", account);
        }
    }, [isAuthenticated, account]);

    return (
        <div>
            {isAuthenticated ? (
                <Button color="primary" variant="outlined" onClick={handleLogout}>
                    Logout
                </Button>
            ) : (
                <Button color="primary" variant="outlined" onClick={handleLogin}>
                    Login
                </Button>
            )}
        </div>
    );
};

export default LoginButton;
