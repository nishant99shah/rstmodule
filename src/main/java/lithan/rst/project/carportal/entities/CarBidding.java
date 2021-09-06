package lithan.rst.project.carportal.entities;

import javax.persistence.*;


@Entity
@Table(name="car_bidding")
public class CarBidding {
    @Id
    @Column(name="id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="car_id")
    private Car car;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private User user;

    @Column(name="Bidder_Name")
    private String bidderName;
    
    @Column(name="Bidding_Price")
    private String bidderPrice;

  
    
  

	public CarBidding() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

	public String getBidderName() {
		return bidderName;
	}

	public void setBidderName(String bidderName) {
		this.bidderName = bidderName;
	}

	public String getBidderPrice() {
		return bidderPrice;
	}

	public void setBidderPrice(String bidderPrice) {
		this.bidderPrice = bidderPrice;
	}

    
   
}
