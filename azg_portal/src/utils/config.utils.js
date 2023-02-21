export const URL_CONFIG = {
  // add the language code to the url of the website, for example /en/home/
  enableLanguagePrefix:
    (process.env.REACT_APP_ENABLE_LANG_PREFIX || false) === "true",
  // the prefix of any assets url
  assetsURL: process.env.REACT_APP_ASSETS_URL || "",
  //the site link
  siteLink: process.env.REACT_APP_SITE_LINK || "http://localhost:3000",
};

export const SETTINGS = {
  //enable debugging of the application
  enableDebug: (process.env.REACT_APP_ENABLE_DEBUG || false) === "true",
  //the website name
  siteName: process.env.REACT_APP_SITENAME || "",
  //the website title
  siteTitle: process.env.REACT_APP_SITETITLE || "",
};
