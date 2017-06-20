//
// Generated by SwaggerStencil
// https://github.com/AttilaTheFun/SwaggerStencil
//

package api

// Profile -
type Profile struct {

	// Image URL of the Uber user.
	Picture string

	// Promo code of the Uber user.
	PromoCode string

	// Last name of the Uber user.
	LastName string

	// Email address of the Uber user
	Email string

	// First name of the Uber user.
	FirstName string
}

// Error -
type Error struct {
	Fields  string
	Code    int64
	Message string
}

// Product -
type Product struct {

	// Unique identifier representing a specific product for a given latitude & longitude. For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles.
	ProductID string

	// Description of product.
	Description string

	// Capacity of product. For example, 4 people.
	Capacity string

	// Display name of product.
	DisplayName string

	// Image URL representing the product.
	Image string
}

// Activities -
type Activities struct {

	// Position in pagination.
	Offset int64

	// Number of items to retrieve (100 max).
	Limit int64

	// Total number of items available.
	Count int64

	History []Activity
}

// Activity -
type Activity struct {

	// Unique identifier for the activity
	UUID string
}

// PriceEstimate -
type PriceEstimate struct {

	// Unique identifier representing a specific product for a given latitude & longitude. For example, uberX in San Francisco will have a different product_id than uberX in Los Angeles
	ProductID string

	// Expected surge multiplier. Surge is active if surge_multiplier is greater than 1. Price estimate already factors in the surge multiplier.
	SurgeMultiplier float64

	// Upper bound of the estimated price.
	HighEstimate float64

	// Lower bound of the estimated price.
	LowEstimate float64

	// Display name of product.
	DisplayName string

	// Formatted string of estimate in local currency of the start location. Estimate could be a range, a single number (flat rate) or "Metered" for TAXI.
	Estimate string

	// [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217) currency code.
	CurrencyCode string
}
