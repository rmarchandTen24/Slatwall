var slatwalladmin;
(function (slatwalladmin) {
    class OrderItemGiftRecipientControl {
        constructor($scope) {
            this.$scope = $scope;
            this.orderItemGiftRecipients = $scope.orderItemGiftRecipients = [];
            console.log('init gift recipient controller');
        }
        add(recipient) {
            this.orderItemGiftRecipients.push(recipient);
        }
        edit(recipient) {
        }
        delete(recipient) {
        }
    }
    OrderItemGiftRecipientControl.$inject = [
        '$scope'
    ];
    slatwalladmin.OrderItemGiftRecipientControl = OrderItemGiftRecipientControl;
    angular.module('slatwalladmin').controller('preprocessorderitem_addorderitemgiftrecipient', OrderItemGiftRecipientControl);
})(slatwalladmin || (slatwalladmin = {}));

//# sourceMappingURL=../controllers/preprocessorderitem_addorderitemgiftrecipient.js.map