import {Link} from 'react-router-dom';
import {LazyLoadImage} from 'react-lazy-load-image-component';

import { SETTINGS } from '../../../utils/config.utils';

const Header = () => {
    return (
        <header id="header" className="header-size-sm bg-black">
            <div className="container d-lg-block d-none">
                <div className="header-row justify-content-between py-2 py-lg-3">
                    <div id="logo" className="col-auto ms-auto ms-mb-0 me-mb-0 order-md-2">
						<Link to="/" className="standard-logo">
							<LazyLoadImage className="mx-auto" src="/images/logo.png" alt={SETTINGS.siteName} />
						</Link>
						<Link to="/" className="retina-logo">
							<LazyLoadImage className="mx-auto mb-4 mb-lg-0" src="/images/logo.png" alt={SETTINGS.siteName} />
						</Link>
					</div>
                </div>
            </div>
        </header>
    )
}

export default Header;