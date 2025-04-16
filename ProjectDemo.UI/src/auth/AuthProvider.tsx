// AuthContext.tsx
import React, { createContext, useEffect, useState, useContext } from "react";
import { useMsal } from "@azure/msal-react";
import { InteractionRequiredAuthError } from "@azure/msal-browser";
import { ReactNode } from "react";

interface AuthState {
    isAuthenticated: boolean;
    accessToken: string | null;
    account: any;
    loading: boolean;
}

// 👇 Define default context value
const defaultAuthState: AuthState = {
    isAuthenticated: false,
    accessToken: null,
    account: null,
    loading: true,
  };

  const AuthContext = createContext<AuthState>(defaultAuthState);

export const AuthProvider = ({ children }: { children: ReactNode }) => {
    const { instance } = useMsal();
    const [authState, setAuthState] = useState<{
        isAuthenticated: boolean;
        accessToken: string | null;
        account: any;
        loading: boolean;
    }>({
        isAuthenticated: false,
        accessToken: null,
        account: null,
        loading: true
    });

    useEffect(() => {
        const initAuth = async () => {
            try {
                const accounts = instance.getAllAccounts();
                if (accounts.length === 0) {
                    setAuthState({ isAuthenticated: false, accessToken: null, account: null, loading: false });
                    return;
                }

                const account = accounts[0];
                instance.setActiveAccount(account);

                const response = await instance.acquireTokenSilent({
                    scopes: ["api://8bfb425b-27ce-43b3-97c1-7a0fff23b38cd/access_as_user"],
                    account
                });

                setAuthState({
                    isAuthenticated: true,
                    accessToken: response.accessToken,
                    account,
                    loading: false
                });
            } catch (error) {
                if (error instanceof InteractionRequiredAuthError) {
                    // Optionally: auto-trigger popup
                    console.warn("Silent token failed, user interaction required");
                }
                setAuthState({ isAuthenticated: false, accessToken: null, account: null, loading: false });
            }
        };

        initAuth();
    }, [instance]);

    return (
        <AuthContext.Provider value={authState}>
            {authState.loading ? <div>Loading auth...</div> : children}
        </AuthContext.Provider>
    );
};

export const useAuth = () => useContext(AuthContext);
