import {Link} from 'react-router-dom';
import {LazyLoadImage} from 'react-lazy-load-image-component';

import SearchForm from './component/search-form/search-form.component';
import SocialLinks from './component/social-links/social-links.component';
import Nav from './component/nav/nav.component';

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

                    <div className="w-100 d-block d-md-none"></div>
                    
                    <div
						className="col-12 col-sm-6 col-md-4 justify-content-center justify-content-sm-start d-flex order-md-1 mb-4 mb-sm-0 align-self-end">
						<SearchForm />
					</div>

                    <div className="col-12 col-sm-6 col-md-4 order-md-3 mb-4 mb-md-0 align-self-end">
						<SocialLinks />
					</div>

                </div>
            </div>

            <div id="header-wrap" className="border-top border-f5 mt-4 d-lg-block d-none">
				<div className="container">
					<div className="header-row justify-content-between flex-row-reverse flex-lg-row">

						<div id="primary-menu-trigger">
							<svg className="svg-trigger" viewBox="0 0 100 100">
								<path
									d="m 30,33 h 40 c 3.722839,0 7.5,3.126468 7.5,8.578427 0,5.451959 -2.727029,8.421573 -7.5,8.421573 h -20">
								</path>
								<path d="m 30,50 h 40"></path>
								<path
									d="m 70,67 h -40 c 0,0 -7.5,-0.802118 -7.5,-8.365747 0,-7.563629 7.5,-8.634253 7.5,-8.634253 h 20">
								</path>
							</svg>
						</div>

						<nav className="primary-menu with-arrows d-block m-auto">
                            <Nav />
						</nav>

					</div>
				</div>
			</div>

            <div className="header-wrap-clone"></div>

            <div className="small-bar py-3 d-block d-lg-none">
                
				<div className="container">
					<div className="row">

						<div className="col-6">
							<LazyLoadImage src="/images/logo.png" alt={SETTINGS.siteName} className="img-fluid w-50" />
						</div>

						<div className="col-6">
							<button className="small-menu-trigger float-end">
								<i className="fas fa-bars"></i>
							</button>
						</div>

					</div>
				</div>

				<div className="small-menu-area">
                    
					<button className="close-small-menu-area text-end m-3 d-block">
						<i className="fas fa-times"></i>
					</button>

					<SearchForm forMobile={true} />

					<Nav forMobile={true} />

					<SocialLinks forMobile={true} />

				</div>

			</div>
        </header>
    )
}

export default Header;