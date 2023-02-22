import {LazyLoadImage} from 'react-lazy-load-image-component';
import {SETTINGS} from '../../../utils/config.utils';

const Footer = () => {
    return (
        <footer id="footer" className="dark">
			<div className="container">
				<div className="footer-widgets-wrap py-5">
					<div className="row justify-content-center">
						<div className="col-7 col-lg-2">
							<LazyLoadImage src="/images/logo.png" alt={SETTINGS.siteName} className="img-fluid w-100" />
						</div>
					</div>
				</div>
			</div>
			<div className="container">
				<div className="row justify-content-center">
					<div className="col-12">
						<hr />
					</div>
					<div className="col-lg-12">
						<p className="text-center">
							© {new Date().getFullYear()} : All rights reserved to {SETTINGS.siteName}
						</p>
					</div>
				</div>
			</div>
		</footer>
    )
}

export default Footer;