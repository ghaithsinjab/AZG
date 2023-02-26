import Image from '../../controls/image/image.component';

const BriefCard = ({item}) => {
    const {icon, number, title} = item;
    return (
        <div className="col-lg-3 col-md-6 mb-4 mb-lg-0">
            <div className="brief-item text-center">
                <Image 
                    src={icon?.data?.attributes?.url} 
                    alt={icon?.data?.attributes?.alternativeText} 
                    className="img-fluid w-25"
                    targetWidth={500}
                    targetHeight={500} />
                <h3 className="mt-2 mb-0">
                    {(number && number.length && (<span>{number}</span>)) || ('')} {title}
                </h3>
            </div>
        </div>
    )
}

export default BriefCard;