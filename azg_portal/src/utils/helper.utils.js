import { URL_CONFIG, SETTINGS } from "./config.utils";

/**
 * @func getFetch automatically add the authorization access token to all GET api calls
 *
 * @param {string} url_string the url to the endpoint being requested
 * @param {object} data the url parameters data to be added to the end point uri
 * @returns {object} the processed response
 */
export const getFetch = async (url_string, data) => {
  const url = new URL(url_string);
  url.search = new URLSearchParams(data);
  const response = await fetch(url, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${process.env.REACT_APP_API_TOKEN}`,
    },
  }).then((resp) => {
    if (!resp.ok) SETTINGS.enableDebug && console.log(resp);
    return resp.json();
  });
  const result = await response;
  if (result.error) throw new Error(result.error.message);
  else return result;
};

/**
 * @function getAPI fetch data from API using GET (automatically adds the api domain name and authentication key)
 * @param {string} url_string the url to the endpoint being requested without the api domain part
 * @param {object} data the url parameters data to be added to the end point uri
 * @returns {object} the processed response
 */
export const getAPI = async (url_string, data, auto = true) => {
  url_string = `${process.env.REACT_APP_API_URL}${url_string}`;
  const result = await getFetch(url_string, data);
  return auto ? result?.data : result;
};

/**
 * @function postFetch automatically add the authorization access token to all POST api calls
 * @param {string} url_string the url to the endpoint being requested
 * @param {object} data the data to be posted to the end point
 * @returns {object} the processed results
 */
export const postFetch = async (url_string, data) => {
  const url = new URL(url_string);
  const response = fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${process.env.REACT_APP_API_TOKEN}`,
    },
    body: JSON.stringify(data),
  })
    .then((resp) => resp.json())
    .catch((error) => {
      if (error.response) console.log(error);
    });
  const result = await response;
  if (result.error) throw new Error(result.error.message);
  else return result?.data;
};

/**
 * @function postFetch fetch data from API using POST (automatically adds the api domain name and authentication key)
 * @param {string} url_string the url to the endpoint being requested without the api domain name
 * @param {object} data the data to be posted to the end point
 * @returns {object} the processed results
 */
export const postAPI = async (url_string, data, auto = true) => {
  url_string = `${process.env.REACT_APP_API_URL}${url_string}`;
  const result = await postFetch(url_string, data);
  return auto ? result?.data : result;
};

/**
 * @func getCurrentNav Get the current navigation item as pointed by the current url
 *
 * @param {array of object} nav the site navigation items
 * @returns the current navigation item according to the currently loaded url in window
 */
export const getCurrentNav = (nav) => {
  let currentLocation = window.location.pathname;
  currentLocation =
    currentLocation.length > 1 && URL_CONFIG.enableLanguagePrefix
      ? currentLocation.substring(3) //removing the language code part /en/home/ => home/
      : currentLocation;

  // remove the trailing forward slash
  currentLocation =
    currentLocation.length > 1 && currentLocation.endsWith("/")
      ? currentLocation.substring(0, currentLocation.length - 1)
      : currentLocation;

  // reduce the nav items array into a one level array to make it easier to find the target url
  const navLinks = nav?.reduce((acc, item) => {
    acc.push({ ...item, items: [] });
    acc = [...acc, ...item.items];
    return acc;
  }, []);

  //return the home page nav link or the relevant nav item
  if (currentLocation === "/")
    return navLinks?.find((item) => item.page_role === "Home");
  else
    return navLinks?.find(
      (item) =>
        item.path === currentLocation || currentLocation.startsWith(item.path)
    );
};

/**
 * @function setSEO set the seo parameters for a page
 * @param {string} title the page title
 * @param {string} description the seo page description
 * @param {string} tags the seo tags
 * @param {string} img the path to the default image for sharing
 */
export const setSEO = (title, description, tags, lang, type, url, img) => {
  //set seo title
  const seoTitle =
    title +
    `${
      SETTINGS.siteName && SETTINGS.siteName.length && ` | ${SETTINGS.siteName}`
    }` +
    `${
      SETTINGS.siteTitle &&
      SETTINGS.siteTitle.length &&
      ` | ${SETTINGS.siteTitle}`
    }`;
  document.title = seoTitle;
  //general
  [
    { key: "description", value: description },
    { key: "keywords", value: tags },
  ].forEach(
    (item) =>
      item.value &&
      item.value.length &&
      (findHeadElement("meta", "name", item.key).content = item.value)
  );
  //facebook graph
  [
    { key: "og:title", value: seoTitle },
    { key: "og:local", value: lang?.replace("-", "_") },
    { key: "og:type", value: type },
    { key: "og:url", value: url && URL_CONFIG.siteLink + url },
    { key: "og:site_name", value: SETTINGS.siteName },
    { key: "og:image:width", value: "256" },
    { key: "og:image:height", value: "256" },
    { key: "og:image", value: img && img.length && URL_CONFIG.siteLink + img },
  ].forEach(
    (item) =>
      item.value &&
      item.value.length &&
      (findHeadElement("meta", "property", item.key).content = item.value)
  );
  //twitter
  [
    { key: "twitter:card", value: "summary" },
    { key: "twitter:title", value: seoTitle },
    {
      key: "twitter:image",
      value: img && img.length && URL_CONFIG.siteLink + img,
    },
    {
      key: "twitter:description",
      value:
        (description ? description : "") +
        (description ? url && " " : "") +
        (url && URL_CONFIG.siteLink + url),
    },
  ].forEach(
    (item) =>
      item.value &&
      item.value.length &&
      item.value !== "undefined" &&
      (findHeadElement("meta", "name", item.key).content = item.value)
  );
  //item prop
  [
    { key: "name", value: seoTitle },
    { key: "image", value: img && img.length && URL_CONFIG.siteLink + img },
  ].forEach(
    (item) =>
      item.value &&
      item.value.length &&
      (findHeadElement("meta", "itemprop", item.key).content = item.value)
  );
};

/**
 * @function findHeadElement find a head element, or create it and append it if it wasn't found
 * @param {string} nodeName the node name to find
 * @param {string} propertyName the property of the node name
 * @param {string} propertyValue the property value of the node name
 * @returns {HTMLElement} the target element
 */
export const findHeadElement = (nodeName, propertyName, propertyValue) => {
  let target = document.head.querySelector(
    `${nodeName}[${propertyName}="${propertyValue}"]`
  );
  if (!target) {
    target = document.createElement(nodeName);
    target.setAttribute(propertyName, propertyValue);
    document.head.appendChild(target);
  }
  return target;
};

/**
 * @function navHasChildren check if a navigation item has children or not
 * @param {object} navItem the navigation object checking for children
 * @param {array<object>} categories product categories list
 * @returns {boolean} nav has children or not
 */
export const navHasChildren = (navItem) => navItem.items.length;

/**
 * @function navGetSubnav get the list of sub nav items
 * @param {object} navItem the navigation object to get its children
 * @param {array<object>} categories product categories list
 * @returns {array<object>} the list of sub menu items
 */
export const navGetSubnav = (navItem) =>
  navHasChildren(navItem) &&
  navItem.items.length &&
  navItem.items.reduce((acc, item) => {
    acc.push({
      id: item.id,
      path: `${navItem.path}/${item.path}`,
      title: item.title,
    });
    return acc;
  }, []);

/**
 * @function navIsCurrent check if a nav item is current, which means it may be the currently opened page, or the parent of a currently opened page
 * @param {object} navItem the nav item to check if it is the current one
 * @param {string} currentPathName the current page path
 * @returns {boolean} nav item is current or not
 */
export const navIsCurrent = (navItem, currentPathName) =>
  navItem.path === currentPathName ||
  (navItem.page_role === "Home" && currentPathName === "/") ||
  currentPathName.startsWith(navItem.path);

/**
 * @function getNavOfType get the navigation item of a certain data type
 * @param {array<object>} nav the list of navigation items
 * @param {string} type the data type name
 * @returns {object} the navigation item of the target type
 */
export const getNavOfType = (nav, type = "") => {
  const target = nav?.filter((item) => item.page_role === type);
  return (target && target.length === 1 && target[0]) || false;
};

export const getYouTubeId = (url) => {
  var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
  var match = url.match(regExp);
  return match && match[2].length === 11 ? match[2] : false;
};
