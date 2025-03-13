
import {useMsal } from "@azure/msal-react";

const LoginButton = () => {
    const { instance } = useMsal();
  
    const handleLogin = () => {
      instance.loginPopup({
        scopes: ["openid", "profile", "email", "api://6a49e346-98a2-46dd-bfd8-f0ed999d3eca/api.read"],
      }).then(response => {
        console.log("Access Token:", response.accessToken);
      }).catch(error => console.error(error));
    };

    return <button onClick={handleLogin}>Login</button>;
  };

export default LoginButton;