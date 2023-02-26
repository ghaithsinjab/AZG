import { URL_CONFIG } from '../../../utils/config.utils';
import './page-bar.styles.scss';

const PageBar = ({title, image}) => {
    const imageUrl = image?.url? URL_CONFIG.assetsURL + image.url : '';
    return (
        <section className="pagebar" style={{backgroundImage: `url('${imageUrl}')`}}>
            <h1>{title}</h1>
        </section>
    )
}

export default PageBar;