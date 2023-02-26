import {useSelector} from 'react-redux';
import {Link} from 'react-router-dom';
import { URL_CONFIG } from '../../../utils/config.utils';
import {selectNav} from '../../../store/nav/nav.selectors';
import {getNavOfType} from '../../../utils/helper.utils';

const BusinessCard = ({item}) => {
    const nav = useSelector(selectNav);
    const businessNavItem = getNavOfType(nav, 'Services');
    const businessUrl = businessNavItem.path || '';
    const {title, image, url} = item;
    return (
        <div className="scale-item">
            <h3 className='text-center'>{title}</h3>
            <div className='scale-bg-img' style={{backgroundImage: `url('${URL_CONFIG.assetsURL}${image?.data?.attributes?.url}')`}}>
                <Link to={businessUrl + '/' + url} className="btn btn2">All Projects</Link>
            </div>
        </div>
    )
}

export default BusinessCard;