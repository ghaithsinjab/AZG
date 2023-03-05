import { useSelector } from "react-redux";
import parse from 'html-react-parser';

import PageBar from "../../components/layout/page-bar/page-bar.component";
import ContactForm from "./components/contact-form.component";

import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";

import './contact.styles.scss';

const Contact = () => {

    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);

    if (!currentNav) return (<div></div>);

    const {related} = currentNav;
    const {title, page_bar, contact_info_title, contact_info} = related;

    return (
        <>
            <PageBar title={title} image={page_bar} />
            <section id="content">
                <div className="content-wrap py-0">

                <section className="careers contact py-5">
					<div className="container">
						<div className="row">
							                            
                            <div className="col-lg-6 mb-4">
                                <h3 className="mb-2">{contact_info_title}</h3>
                                <div className="content-container">
                                    {parse(contact_info || '')}
                                </div>
                            </div>

							<div className="col-lg-6 mb-4">
                                <ContactForm />
                            </div>

						</div>
					</div>
				</section>

                </div>
            </section>
        </>
    )
}

export default Contact;