/**
 * the collection of http requests for the NAV
 *
 * author: Ghaith Sinjab
 * created: 10/2/2023 @ 17:02
 */

import { getAPI } from "../../utils/helper.utils";

/**
 * @function httpGetNav fetch the website navigation items
 * @param {string} direction the direction of the navigation to be fetched (default main-navigation)
 * @param {bool} onlyActive fetch only active navigations
 * @return {array<object>} the list of navigation items
 */
export const httpGetNav = async (
  direction = "main-navigation",
  onlyActive = true
) => {
  const filter = {
    type: "TREE",
  };
  let fetchedData = await getAPI(
    `navigation/render/${direction}`,
    filter,
    false
  );
  fetchedData =
    (onlyActive && fetchedData?.filter((item) => item.active)) || fetchedData;
  return fetchedData;
};