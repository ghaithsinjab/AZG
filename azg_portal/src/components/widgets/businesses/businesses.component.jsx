import {useSelector} from 'react-redux';
import {Link} from 'react-router-dom';
import {Carousel} from 'react-responsive-carousel';
import { URL_CONFIG } from '../../../utils/config.utils';
import {selectNav} from '../../../store/nav/nav.selectors';
import {getNavOfType} from '../../../utils/helper.utils';

const Businesses = ({title, link_title, link_url, items}) => {
    const nav = useSelector(selectNav);
    const businessNavItem = getNavOfType(nav, 'Services');
    const businessUrl = businessNavItem.path || '';
    return (
        <>
        {
            items && items.length && (
                <section className="business py-5">
                    <div className="container">
                        <div className="row">
                            <div className="col-6">
                                <div className="section-title">
                                    <h3 className="fw-bold text-uppercase">{title}</h3>
                                </div>
                            </div>
                            <div className="col-6">
                                {
                                    link_title && link_title.length && link_url && link_url.length ? (
                                        <Link to={link_url} className="btn btn2 float-end">{link_title}</Link>
                                    ) : ('')
                                }
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-12">
                                <Carousel showThumbs={false}>
                                    {
                                        items?.map(item => (
                                            <div className="scale-item" key={item.id}>
                                                <h3 className='text-center'>{item.attributes.title}</h3>
                                                <div className='scale-bg-img' style={{backgroundImage: `url('${URL_CONFIG.assetsURL}${item.attributes.image?.data?.attributes?.url}')`}}>
                                                    <Link to={businessUrl + item.attributes.url} className="btn btn2">All Projects</Link>
                                                </div>
                                            </div>
                                        ))
                                    }
                                </Carousel>
                            </div>
                        </div>
                    </div>
                </section>
            )
        }
        </>
    )
}

export default Businesses;