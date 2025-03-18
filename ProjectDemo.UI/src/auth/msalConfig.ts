/*
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License.
 */

import { PublicClientApplication, LogLevel  } from "@azure/msal-browser";

/**
 * Configuration object to be passed to MSAL instance on creation. 
 * For a full list of MSAL.js configuration parameters, visit:
 * https://github.com/AzureAD/microsoft-authentication-library-for-js/blob/dev/lib/msal-browser/docs/configuration.md 
 */

const msalConfig = {
  auth: {
    clientId: "6a49e346-98a2-46dd-bfd8-f0ed999d3eca",
    authority: "https://login.microsoftonline.com/73bf9c05-bd27-4332-a610-bb1a50300369",
    redirectUri: "http://localhost:3000",
  },
  cache: {
    cacheLocation: "sessionStorage",
    storeAuthStateInCookie: false,
  },
  system: {	
      loggerOptions: {	
          loggerCallback: (level: any, message: string, containsPii: boolean) => {	
              if (containsPii) {		
                  return;		
              }		
              switch (level) {
                  case LogLevel.Error:
                      console.error(message);
                      return;
                  case LogLevel.Info:
                      console.info(message);
                      return;
                  case LogLevel.Verbose:
                      console.debug(message);
                      return;
                  case LogLevel.Warning:
                      console.warn(message);
                      return;
                  default:
                      return;
              }	
          }	
      }	
  }
};

export const msalInstance = new PublicClientApplication(msalConfig);
