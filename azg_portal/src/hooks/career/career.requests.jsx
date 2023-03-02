import { getAPI } from "../../utils/helper.utils";

export const httpGetCareer = async () => {
    let filter = {};
    const fetchedResults = await getAPI('vacancies', filter);
    return fetchedResults || [];
}