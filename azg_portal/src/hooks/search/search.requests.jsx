import {getAPI} from '../../utils/helper.utils';

export const httpGetSearchPage = async () => {
    const filter = {
        "populate[0]": "page_bar"
    };
    const fetched = await getAPI('search-page', filter);
    return fetched;
}

export const httpGetSearch = async (searchTerm) => {
    let filter = {
        "q": searchTerm,
        "populate": "image"
    };
    const fetched = await getAPI('search', filter, false);
    return fetched;
}