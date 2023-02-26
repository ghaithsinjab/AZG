import { LazyLoadImage } from "react-lazy-load-image-component";
import { URL_CONFIG } from "../../../utils/config.utils";

const Image = ({src, targetWidth = 0, targetHeight = 0, ...props}) => {
    const imgUrl = src && src.length ? URL_CONFIG.assetsURL + src : '';
    return <LazyLoadImage 
        src={imgUrl} 
        {...props} 
        effect="blur" />
}

export default Image;