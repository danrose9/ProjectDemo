import { useMsal } from "@azure/msal-react";

export const callApi = async (accessToken: string): Promise<void> => {
  try {
      
      const response = await fetch("https://project-demo-api.azurewebsites.net/admin", {
          method: "GET",
          headers: {
              Authorization: `Bearer ${accessToken}`,
              "Content-Type": "application/json",
          },
      });

      console.log("Response Status:", response.status);
      console.log("Response Headers:", response.headers);

      if (!response.ok) {
          const errorText = await response.text();
          throw new Error(`API call failed with status ${response.status}: ${errorText}`);
      }

      const data = await response.json();
      console.log("API Response:", data);
  } catch (error) {
      console.error("API call failed:", error);
  }
};


  

  