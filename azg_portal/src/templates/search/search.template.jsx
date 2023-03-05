import { useSearchParams, Link } from 'react-router-dom';
import { useSelector } from 'react-redux';

import PageBar from "../../components/layout/page-bar/page-bar.component";
import Image from '../../components/controls/image/image.component';

import { useSearchPage, useSearch } from '../../hooks/search/search.hooks';
import { selectNav } from '../../store/nav/nav.selectors';
import { getNavOfType } from '../../utils/helper.utils';

import './search.styles.scss';

const Search = () => {
    const [searchParams] = useSearchParams();
    const searchTerm = searchParams.get('q');
    const nav = useSelector(selectNav);

    const searchPage = useSearchPage();
    const searchResults = useSearch(searchTerm);

    return (
        <>
            <PageBar title={searchPage?.attributes?.title} image={searchPage?.attributes?.page_bar?.data?.attributes} />
            <section id="content">
                <div className="content-wrap py-0">

                    <div className="container">
                        <div className='row'>
                            <div className="col-lg-12 mb-4 mt-4 mb-lg-0 align-self-center">
								<div className="section-title">
									<h3 className="fw-bold text-uppercase">Searching for "{searchTerm}"</h3>
								</div>
							</div>
                        </div>
                    </div>

                    <section className="search-listing py-5 eH-Area">
                        <div className="container">
                            <div className="row py-2">
                                {
                                    searchResults?.map(item => {
                                        const {id, title, image, url, type} = item;
                                        const navType = getNavOfType(nav, type);
                                        const {path: baseUrl} = navType;
                                        return (
                                            <div key={type + id} className="col-12 col-lg-6">
                                                <Link to={`${baseUrl}/${url}`}>
                                                    <Image src={image?.url} alt={image?.alternativeText} targetWidth={200} targetHeight={200} />
                                                    <h3><small>{type}</small>{title}</h3>
                                                </Link>
                                            </div>
                                        )
                                    })
                                }
                            </div>
                        </div>
                    </section>

                </div>
            </section>
        </>
    )
}

export default Search;