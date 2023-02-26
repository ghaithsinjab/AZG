import {ParallaxBanner, ParallaxProvider} from 'react-scroll-parallax';
import {Carousel} from 'react-responsive-carousel';
import {Link} from 'react-router-dom';
import { URL_CONFIG } from '../../../utils/config.utils';

import 'react-responsive-carousel/lib/styles/carousel.min.css';
import './slider.styles.scss';

const Slider = ({slides}) => {
    return (
        <section id="slider"
			className="min-vh-75 min-vh-md-100">
            <ParallaxProvider>
                <Carousel 
                    className='home-slider-carousel' 
                    showThumbs={false} 
                    emulateTouch={true} 
                    autoPlay={true} 
                    showStatus={false} 
                    showIndicators={false}
                    infiniteLoop={true}>
                    {
                        slides?.map(item => (
                            <ParallaxBanner key={item.id} className="min-vh-75 min-vh-md-100" layers={[
                                {image: `${URL_CONFIG.assetsURL}${item.image.data?.attributes.url}`, speed: -30, className: 'min-vh-75 min-vh-md-100'},
                                {
                                    speed: -15,
                                    children: (
                                        <div className='home-slider-caption'>
                                            <div className='slider-caption-main'>
                                                <h3 className='slide-count fs2' data-animate="fadeInUp">{item.caption?.number}</h3>
                                                <h2 className='fs-2'>{item.caption?.title}</h2>
                                                <p className='d-none d-sm-block'>
                                                    {item.caption?.details}
                                                    {
                                                        item.caption?.link_url ? (
                                                            <Link to={item.caption?.link_url}>
                                                                <i className='fas fa-arrow-right'></i>
                                                            </Link>
                                                        ) : ('')
                                                    }
                                                </p>
                                            </div>
                                            <div className='slider-boxes d-none d-lg-inline-flex'>
                                                {
                                                    item.boxes?.map(box_item => (
                                                        <div className='box-item' key={box_item.id}>
                                                            <p className='text-start'>{box_item.text}</p>
                                                        </div>
                                                    ))
                                                }
                                            </div>
                                        </div>
                                    )
                                }
                            ]} />
                        ))
                    }
                </Carousel>
            </ParallaxProvider>
		</section>
    )
}

export default Slider;