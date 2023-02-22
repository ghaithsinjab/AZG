import {getAPI} from '../../utils/helper.utils';

export const httpGetServices = async () => {
    const filter = {
        'populate[0]': 'image'
    };
    const results = await getAPI('services', filter);
    return results;
}