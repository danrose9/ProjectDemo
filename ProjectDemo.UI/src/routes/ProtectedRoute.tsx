import { Route, Navigate } from "react-router-dom";
import { useIsAuthenticated } from "@azure/msal-react";

import { ReactElement } from "react";
import LandingPage from "../components/LandingPage";

interface ProtectedRouteProps {
  element: ReactElement;
  [key: string]: any;
}

function ProtectedRoute({ element: Component, ...rest }: ProtectedRouteProps) {
  const isAuthenticated = useIsAuthenticated();
  return isAuthenticated ? <LandingPage {...rest} /> : <Navigate to="/" />;
}
export default ProtectedRoute;