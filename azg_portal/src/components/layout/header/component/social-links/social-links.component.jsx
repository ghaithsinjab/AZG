import { useSocial } from "../../../../../hooks/social/social.hooks";

const SocialLinks = ({forMobile}) => {
    const social = useSocial();
    if (forMobile) return (
        <ul className="small-menu-items social">
            {
                social?.map(item => (
                    <a key={item.id} href={item.attributes.url} target="_blank" rel="noreferrer">
                        <i className={item.attributes.icon.replace('icon-', 'fab fa-')}></i>
                    </a>
                ))
            }
        </ul>
    );
    else return (
        <div className="float-lg-end justify-content-center d-flex d-lg-inline-flex">
            {
                social?.map(item => (
                    <a key={item.id} href={item.attributes.url} target="_blank" rel="noreferrer" className={`social-icon si-small si-rounded si-dark si-mini si-${item.attributes.icon.replace('icon-', '')} mb-0`}>
                        <i className={item.attributes.icon}></i>
                        <i className={item.attributes.icon}></i>
                    </a>
                ))
            }
        </div>
    );
}

export default SocialLinks;