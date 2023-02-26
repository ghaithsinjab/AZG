import {getAPI} from '../../utils/helper.utils';

export const httpGetMedia = async () => {
    const filter = {
        'populate[0]': 'image'
    };
    const results = await getAPI('media-items', filter);
    return results;
}