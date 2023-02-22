import {getAPI} from '../../utils/helper.utils';

export const httpGetHomePage = async () => {
    const filters = {
        'populate[0]': 'slider',
        'populate[1]': 'slider.image',
        'populate[2]': 'slider.caption',
        'populate[3]': 'slider.boxes',
        'populate[4]': 'about_us',
        'populate[5]': 'about_us.image',
    };
    const results = await getAPI('home-page', filters);
    return results;
}