import { getAPI } from "../../utils/helper.utils";

export const httpGetSocial = async () => {
    const filter = {};
    const fetchedData = await getAPI('social-links', filter);
    return fetchedData;
}