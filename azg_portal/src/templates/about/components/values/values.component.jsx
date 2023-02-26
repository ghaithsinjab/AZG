const Values = ({title, items}) => {
    return (
        <section className="values bg-dark py-5">
            <div className="container">
                
                {
                    title && title.length ? (
                        <div className="row mb-5">
                            <div className="col-12 section-title">
                                <h3 className="fw-bold text-uppercase text-white">{title}</h3>
                            </div>
                        </div>
                    ) : ('')
                }

                <div className="row">
                    {
                        items?.map(({title, text}) => (
                            <div className="col-lg-4">
                                <div className="value-item">
                                    <h2 className="accent-color">{title}</h2>
                                    <p className="text-white">{text}</p>
                                </div>
                            </div>
                        ))
                    }
                </div>
                
            </div>
        </section>
    )
}

export default Values;