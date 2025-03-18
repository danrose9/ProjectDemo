import { useMsal } from "@azure/msal-react";

const callApi = async (accessToken: string): Promise<void> => {
    try {
      const response = await fetch("https://localhost:5001/protected-endpoint", {
        method: "GET",
        headers: {
          Authorization: `Bearer ${accessToken}`,
          "Content-Type": "application/json",
        },
      });
  
      if (!response.ok) {
        throw new Error(`API call failed with status: ${response.status}`);
      }
  
      const data = await response.json();
      console.log("API Response:", data);
    } catch (error) {
      console.error("API call failed:", error);
    }
  };
  
  const handleLogin = async (): Promise<void> => {

    const { instance } = useMsal();

    try {
      const response = await instance.loginPopup({
        scopes: ["api://6a49e346-98a2-46dd-bfd8-f0ed999d3eca/api.read"],
      });
  
      console.log("Access Token:", response.accessToken);
      await callApi(response.accessToken);
    } catch (error) {
      console.error("Login failed:", error);
    }
  };
  