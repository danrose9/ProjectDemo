import { useMsal } from "@azure/msal-react";

const fetchData = async () => {
    const { instance } = useMsal();
    const account = instance.getActiveAccount();
    
    if (account) {
        const response = await instance.acquireTokenSilent({
            scopes: ["api://8bfb425b-27ce-43b3-97c1-7a0fff23b38c/access_as_user"]
        });

        const token = response.accessToken;
        
        const apiResponse = await fetch("https://projectdemo-api.azurewebsites.net/admin", {
            headers: { Authorization: `Bearer ${token}` }
        });

        const data = await apiResponse.json();
        console.log(data);
    }
};
