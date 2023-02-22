import {ParallaxBanner, ParallaxProvider} from 'react-scroll-parallax';
import {Carousel} from 'react-responsive-carousel';
import {Link} from 'react-router-dom';
import { URL_CONFIG } from '../../../utils/config.utils';

import 'react-responsive-carousel/lib/styles/carousel.min.css';

const Slider = ({slides}) => {
    return (
        <section id="slider"
			className="min-vh-75 min-vh-md-100 include-header">
            <ParallaxProvider>
                <Carousel className='home-slider-carousel' showThumbs={false}>
                    {
                        slides?.map(item => (
                            <ParallaxBanner key={item.id} layers={[
                                {image: `${URL_CONFIG.assetsURL}${item.image.data?.attributes.url}`, speed: -20},
                                {
                                    speed: -15,
                                    children: (
                                        <div className='slider-caption'>
                                            <div className='slider-caption-main'>
                                                <h3 className='slide-count fs2'>{item.caption?.number}</h3>
                                                <h2 className='fs-2'>{item.caption?.title}</h2>
                                                <p className='d-none d-sm-block'>
                                                    {item.caption?.details}
                                                    {
                                                        item.caption?.link_url ? (
                                                            <Link to={item.caption?.link_url}>
                                                                <i className='fas fa-arrow-right ms-4'></i>
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