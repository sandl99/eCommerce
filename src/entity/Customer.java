package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the customer database table.
 * 
 */
@Entity
@Table(name="customer")
@NamedQueries({
	@NamedQuery(name="Customer.findAll", query="SELECT c FROM Customer c"),
	@NamedQuery(name="Customer.findByUsername", query="SELECT c FROM Customer c WHERE c.username = :username")
})
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="customer_id", unique=true, nullable=false)
	private int customerId;

	@Column(length=255)
	private String address;

	@Column(length=225)
	private String ccNumber;

	@Column(name="city_region", length=255)
	private String cityRegion;

	@Column(length=225)
	private String email;

	@Column(length=255)
	private String name;

	@Column(length=225)
	private String password;

	@Column(length=255)
	private String phone;

	@Column(length=225)
	private String username;

	//bi-directional many-to-one association to CustomerOrder
	@OneToMany(mappedBy="customer", cascade={CascadeType.ALL})
	private List<CustomerOrder> customerOrders;
	
	//bi-directional many-to-one association to Address
	@OneToMany(mappedBy="customer")
	private List<Address> addresses;

	public Customer() {
	}

	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCcNumber() {
		return this.ccNumber;
	}

	public void setCcNumber(String ccNumber) {
		this.ccNumber = ccNumber;
	}

	public String getCityRegion() {
		return this.cityRegion;
	}

	public void setCityRegion(String cityRegion) {
		this.cityRegion = cityRegion;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<CustomerOrder> getCustomerOrders() {
		return this.customerOrders;
	}

	public void setCustomerOrders(List<CustomerOrder> customerOrders) {
		this.customerOrders = customerOrders;
	}

	public CustomerOrder addCustomerOrder(CustomerOrder customerOrder) {
		getCustomerOrders().add(customerOrder);
		customerOrder.setCustomer(this);

		return customerOrder;
	}

	public CustomerOrder removeCustomerOrder(CustomerOrder customerOrder) {
		getCustomerOrders().remove(customerOrder);
		customerOrder.setCustomer(null);

		return customerOrder;
	}
	public List<Address> getAddresses() {
		return this.addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public Address addAddress(Address address) {
		getAddresses().add(address);
		address.setCustomer(this);

		return address;
	}

	public Address removeAddress(Address address) {
		getAddresses().remove(address);
		address.setCustomer(null);

		return address;
	}

}