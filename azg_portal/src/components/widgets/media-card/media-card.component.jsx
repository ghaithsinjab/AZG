import {useSelector} from 'react-redux';
import {Link} from 'react-router-dom';
import { URL_CONFIG } from '../../../utils/config.utils';
import {selectNav} from '../../../store/nav/nav.selectors';
import {getNavOfType} from '../../../utils/helper.utils';

import './media-card.styles.scss';

const MediaCard = ({item}) => {
    const nav = useSelector(selectNav);
    const mediaNavItem = getNavOfType(nav, 'Media');
    const mediaUrl = mediaNavItem.path || '';
    const {title, url, image, youtube} = item;

    const getYouTubeId = url => {
        var regExp = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|&v=)([^#&?]*).*/;
        var match = url.match(regExp);
        return match && match[2].length === 11 ? match[2] : false;
    }

    return (
        <div className={`scale-item${youtube && youtube.length ? ' video-item': ''}`}>
            <Link to={mediaUrl + '/' + url}>
                {
                    youtube && youtube.length ? (
                        <div className="video-area p-3 p-lg-4">
                            <iframe width="1904" height="100%" src={`https://www.youtube.com/embed/${getYouTubeId(youtube)}`}
                                frameBorder="0"
                                title={title}
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                allowFullScreen
                            >
                            </iframe>
                        </div>
                    ) : (
                        <div className="scale-bg-img" style={{backgroundImage: `url('${URL_CONFIG.assetsURL + image?.data?.attributes?.url}')`}}></div>
                    )
                }
                <h3 className="text-center">{title}</h3>
            </Link>
        </div>
    )
}

export default MediaCard;