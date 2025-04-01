
import {useMsal } from "@azure/msal-react";
import { callApi } from "../api/callApi";

const LoginButton = () => {
    const { instance } = useMsal();
  
    const handleLogin = async (): Promise<void> => {
  
      try {
          const response = await instance.loginPopup({
              scopes: ["api://8bfb425b-27ce-43b3-97c1-7a0fff23b38c/access_as_user"]
          });
  
          console.log("Access Token:", response.accessToken);
          console.log("Id Token:", response.idToken);
          console.log("Response", response);

          const accounts = instance.getAllAccounts();

          console.log("Accounts:", accounts); 
        if (accounts.length > 0) {
            instance.setActiveAccount(accounts[0]);  // Set the active account
        }

          await callApi(response.accessToken);
      } catch (error) {
          console.error("Login failed:", error);
      }
  };


    return <button onClick={handleLogin}>Login</button>;
  };

export default LoginButton;