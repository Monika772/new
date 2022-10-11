<div class="row">
    <div class="col-lg-4">
        <div class="amount-box text-center">
            <h5>Total </h5>
            <div class="d-flex align-items-center justify-content-ceter">
                <div class="round-box d-flex align-items-center justify-content-ceter">
                    <h3 id="monthly_amount">{{!empty($earning['totalAmount'])?$earning['totalAmount']:0}}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="amount-box text-center">
            <h5>Employee</h5>
            <div class="d-flex align-items-center justify-content-ceter">
                <div class="round-box d-flex align-items-center justify-content-ceter">
                    <h3 id="monthly_amount">{{!empty($earning['candidateIncome'])?$earning['candidateIncome']:0}}</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
        <div class="amount-box text-center">
            <h5>Admin </h5>
            <div class="d-flex align-items-center justify-content-ceter">
                <div class="round-box d-flex align-items-center justify-content-ceter">
                    <h3 id="monthly_amount">{{!empty($earning['adminIncome'])?$earning['adminIncome']:0}}</h3>
                </div>
            </div>
        </div>
    </div>
</div>