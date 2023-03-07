import {getAPI} from '../../utils/helper.utils';

export const httpGetServices = async () => {
    const filter = {
        'populate[0]': 'image'
    };
    const results = await getAPI('services', filter);
    return results;
}

export const httpGetServiceId = async (url) => {
    const filter = {
        'filters[url][$eq]': url
    };
    const result = await getAPI(`services`, filter);
    return (result && result.length && result[0].id) || 0;
}

export const httpGetServiceItem = async (id) => {
    const filter = {
        'populate': '*'
    };
    const result = await getAPI(`services/${id}`, filter);
    return result || {};
}