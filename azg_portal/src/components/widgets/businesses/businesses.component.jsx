import {Link} from 'react-router-dom';
import BusinessCard from '../business-card/business-card.component';
import Slider from 'react-slick';

import "../../../assets/slick.scss";
import "../../../assets/slick-theme.scss";
import "./businesses.styles.scss";

const Businesses = ({title, link_title, link_url, items}) => {
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
                                <Slider dots={true} infinite={true} slidesToShow={3} lazyLoad="progressive" responsive={[
                                    {
                                        breakpoint: 1024,
                                        settings: { slidesToShow: 2}
                                    },
                                    {
                                        breakpoint: 500,
                                        settings: {slidesToShow: 1}
                                    }
                                ]}>
                                    {
                                        items?.map(item => <BusinessCard item={item.attributes} key={item.id} />)
                                    }
                                </Slider>
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