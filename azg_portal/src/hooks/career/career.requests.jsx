import { getAPI, postAPI } from "../../utils/helper.utils";

export const httpGetCareer = async () => {
    let filter = {};
    const fetchedResults = await getAPI('vacancies', filter);
    return fetchedResults || [];
}

export const httpSubmitCareer = async (career) => {
    const results = await postAPI('career-candidates', {data: career}, false);
    return results;
}