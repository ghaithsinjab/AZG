import {getAPI} from '../../utils/helper.utils';

export const httpGetMedia = async () => {
    const filter = {
        'populate[0]': 'image'
    };
    const results = await getAPI('media-items', filter);
    return results;
}

export const httpGetMediaId = async (url) => {
    const filter = {
        'filters[url][$eq]': url
    };
    const result = await getAPI(`media-items`, filter);
    return (result && result.length && result[0].id) || 0;
}

export const httpGetMediaItem = async (id) => {
    const filter = {
        'populate': '*'
    };
    const result = await getAPI(`media-items/${id}`, filter);
    return result || {};
}